import logo from './logo.svg';
import './App.css';
import Grid from '@mui/material/Grid';
import { styled } from '@mui/material';
import Paper from '@mui/material/Paper';

const Item = styled(Paper)(({ theme }) => ({
  backgroundColor: theme.palette.mode === 'dark' ? '#1A2027' : '#fff',
  ...theme.typography.body2,
  padding: theme.spacing(1),
  textAlign: 'center',
  color: theme.palette.text.secondary,
}));

function App() {
  return (
    <Grid container spacing={2}>
      <Grid item xs={6} md={8}>
    <Item>xs=6 md=8</Item>
  </Grid>
    </Grid>
  )
}

export default App;
